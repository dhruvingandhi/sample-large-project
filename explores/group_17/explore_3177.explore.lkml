# Explore: explore_3177
# Auto-generated LookML Explore File

include: "/views/domain_32/view_09532.view.lkml"
include: "/views/domain_34/view_09534.view.lkml"
include: "/views/domain_35/view_09535.view.lkml"
include: "/views/domain_36/view_09536.view.lkml"

explore: explore_3177 {
  label: "Explore Explore 3177"
  description: "Comprehensive analytics explore joining base view_09532 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_09532
  
  always_filter: {
    filters: [view_09532.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09532.created_at_date: "7 days"]
    unless: [view_09532.id, view_09532.status]
  }

  join: view_09534 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09532.user_id} = ${view_09534.id} ;;
    required_joins: []
  }

  join: view_09535 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09532.account_id} = ${view_09535.account_id} ;;
    required_joins: [view_09534]
  }

  join: view_09536 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09532.category} = ${view_09536.category} ;;
  }

  access_filter: {
    field: view_09532.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09532.is_deleted} = false ;;
}
