# Explore: explore_0895
# Auto-generated LookML Explore File

include: "/views/domain_36/view_02686.view.lkml"
include: "/views/domain_38/view_02688.view.lkml"
include: "/views/domain_39/view_02689.view.lkml"
include: "/views/domain_40/view_02690.view.lkml"

explore: explore_0895 {
  label: "Explore Explore 0895"
  description: "Comprehensive analytics explore joining base view_02686 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_02686
  
  always_filter: {
    filters: [view_02686.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02686.created_at_date: "7 days"]
    unless: [view_02686.id, view_02686.status]
  }

  join: view_02688 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02686.user_id} = ${view_02688.id} ;;
    required_joins: []
  }

  join: view_02689 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02686.account_id} = ${view_02689.account_id} ;;
    required_joins: [view_02688]
  }

  join: view_02690 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02686.category} = ${view_02690.category} ;;
  }

  access_filter: {
    field: view_02686.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02686.is_deleted} = false ;;
}
