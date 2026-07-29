# Explore: explore_0778
# Auto-generated LookML Explore File

include: "/views/domain_35/view_02335.view.lkml"
include: "/views/domain_37/view_02337.view.lkml"
include: "/views/domain_38/view_02338.view.lkml"
include: "/views/domain_39/view_02339.view.lkml"

explore: explore_0778 {
  label: "Explore Explore 0778"
  description: "Comprehensive analytics explore joining base view_02335 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_02335
  
  always_filter: {
    filters: [view_02335.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02335.created_at_date: "7 days"]
    unless: [view_02335.id, view_02335.status]
  }

  join: view_02337 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02335.user_id} = ${view_02337.id} ;;
    required_joins: []
  }

  join: view_02338 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02335.account_id} = ${view_02338.account_id} ;;
    required_joins: [view_02337]
  }

  join: view_02339 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02335.category} = ${view_02339.category} ;;
  }

  access_filter: {
    field: view_02335.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02335.is_deleted} = false ;;
}
