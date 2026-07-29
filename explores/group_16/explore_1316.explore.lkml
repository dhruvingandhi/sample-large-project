# Explore: explore_1316
# Auto-generated LookML Explore File

include: "/views/domain_49/view_03949.view.lkml"
include: "/views/domain_01/view_03951.view.lkml"
include: "/views/domain_02/view_03952.view.lkml"
include: "/views/domain_03/view_03953.view.lkml"

explore: explore_1316 {
  label: "Explore Explore 1316"
  description: "Comprehensive analytics explore joining base view_03949 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_03949
  
  always_filter: {
    filters: [view_03949.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03949.created_at_date: "7 days"]
    unless: [view_03949.id, view_03949.status]
  }

  join: view_03951 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03949.user_id} = ${view_03951.id} ;;
    required_joins: []
  }

  join: view_03952 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03949.account_id} = ${view_03952.account_id} ;;
    required_joins: [view_03951]
  }

  join: view_03953 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03949.category} = ${view_03953.category} ;;
  }

  access_filter: {
    field: view_03949.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03949.is_deleted} = false ;;
}
