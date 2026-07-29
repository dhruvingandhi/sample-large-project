# Explore: explore_2678
# Auto-generated LookML Explore File

include: "/views/domain_35/view_08035.view.lkml"
include: "/views/domain_37/view_08037.view.lkml"
include: "/views/domain_38/view_08038.view.lkml"
include: "/views/domain_39/view_08039.view.lkml"

explore: explore_2678 {
  label: "Explore Explore 2678"
  description: "Comprehensive analytics explore joining base view_08035 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08035
  
  always_filter: {
    filters: [view_08035.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08035.created_at_date: "7 days"]
    unless: [view_08035.id, view_08035.status]
  }

  join: view_08037 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08035.user_id} = ${view_08037.id} ;;
    required_joins: []
  }

  join: view_08038 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08035.account_id} = ${view_08038.account_id} ;;
    required_joins: [view_08037]
  }

  join: view_08039 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08035.category} = ${view_08039.category} ;;
  }

  access_filter: {
    field: view_08035.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08035.is_deleted} = false ;;
}
