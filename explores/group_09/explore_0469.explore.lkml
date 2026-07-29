# Explore: explore_0469
# Auto-generated LookML Explore File

include: "/views/domain_08/view_01408.view.lkml"
include: "/views/domain_10/view_01410.view.lkml"
include: "/views/domain_11/view_01411.view.lkml"
include: "/views/domain_12/view_01412.view.lkml"

explore: explore_0469 {
  label: "Explore Explore 0469"
  description: "Comprehensive analytics explore joining base view_01408 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_01408
  
  always_filter: {
    filters: [view_01408.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01408.created_at_date: "7 days"]
    unless: [view_01408.id, view_01408.status]
  }

  join: view_01410 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01408.user_id} = ${view_01410.id} ;;
    required_joins: []
  }

  join: view_01411 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01408.account_id} = ${view_01411.account_id} ;;
    required_joins: [view_01410]
  }

  join: view_01412 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01408.category} = ${view_01412.category} ;;
  }

  access_filter: {
    field: view_01408.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01408.is_deleted} = false ;;
}
