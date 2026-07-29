# Explore: explore_0808
# Auto-generated LookML Explore File

include: "/views/domain_25/view_02425.view.lkml"
include: "/views/domain_27/view_02427.view.lkml"
include: "/views/domain_28/view_02428.view.lkml"
include: "/views/domain_29/view_02429.view.lkml"

explore: explore_0808 {
  label: "Explore Explore 0808"
  description: "Comprehensive analytics explore joining base view_02425 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_02425
  
  always_filter: {
    filters: [view_02425.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02425.created_at_date: "7 days"]
    unless: [view_02425.id, view_02425.status]
  }

  join: view_02427 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02425.user_id} = ${view_02427.id} ;;
    required_joins: []
  }

  join: view_02428 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02425.account_id} = ${view_02428.account_id} ;;
    required_joins: [view_02427]
  }

  join: view_02429 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02425.category} = ${view_02429.category} ;;
  }

  access_filter: {
    field: view_02425.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02425.is_deleted} = false ;;
}
