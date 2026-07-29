# Explore: explore_2415
# Auto-generated LookML Explore File

include: "/views/domain_46/view_07246.view.lkml"
include: "/views/domain_48/view_07248.view.lkml"
include: "/views/domain_49/view_07249.view.lkml"
include: "/views/domain_50/view_07250.view.lkml"

explore: explore_2415 {
  label: "Explore Explore 2415"
  description: "Comprehensive analytics explore joining base view_07246 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07246
  
  always_filter: {
    filters: [view_07246.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07246.created_at_date: "7 days"]
    unless: [view_07246.id, view_07246.status]
  }

  join: view_07248 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07246.user_id} = ${view_07248.id} ;;
    required_joins: []
  }

  join: view_07249 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07246.account_id} = ${view_07249.account_id} ;;
    required_joins: [view_07248]
  }

  join: view_07250 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07246.category} = ${view_07250.category} ;;
  }

  access_filter: {
    field: view_07246.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07246.is_deleted} = false ;;
}
