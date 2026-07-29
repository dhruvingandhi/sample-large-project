# Explore: explore_1678
# Auto-generated LookML Explore File

include: "/views/domain_35/view_05035.view.lkml"
include: "/views/domain_37/view_05037.view.lkml"
include: "/views/domain_38/view_05038.view.lkml"
include: "/views/domain_39/view_05039.view.lkml"

explore: explore_1678 {
  label: "Explore Explore 1678"
  description: "Comprehensive analytics explore joining base view_05035 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_05035
  
  always_filter: {
    filters: [view_05035.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05035.created_at_date: "7 days"]
    unless: [view_05035.id, view_05035.status]
  }

  join: view_05037 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05035.user_id} = ${view_05037.id} ;;
    required_joins: []
  }

  join: view_05038 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05035.account_id} = ${view_05038.account_id} ;;
    required_joins: [view_05037]
  }

  join: view_05039 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05035.category} = ${view_05039.category} ;;
  }

  access_filter: {
    field: view_05035.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05035.is_deleted} = false ;;
}
