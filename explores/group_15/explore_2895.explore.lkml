# Explore: explore_2895
# Auto-generated LookML Explore File

include: "/views/domain_36/view_08686.view.lkml"
include: "/views/domain_38/view_08688.view.lkml"
include: "/views/domain_39/view_08689.view.lkml"
include: "/views/domain_40/view_08690.view.lkml"

explore: explore_2895 {
  label: "Explore Explore 2895"
  description: "Comprehensive analytics explore joining base view_08686 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08686
  
  always_filter: {
    filters: [view_08686.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08686.created_at_date: "7 days"]
    unless: [view_08686.id, view_08686.status]
  }

  join: view_08688 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08686.user_id} = ${view_08688.id} ;;
    required_joins: []
  }

  join: view_08689 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08686.account_id} = ${view_08689.account_id} ;;
    required_joins: [view_08688]
  }

  join: view_08690 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08686.category} = ${view_08690.category} ;;
  }

  access_filter: {
    field: view_08686.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08686.is_deleted} = false ;;
}
