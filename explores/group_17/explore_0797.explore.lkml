# Explore: explore_0797
# Auto-generated LookML Explore File

include: "/views/domain_42/view_02392.view.lkml"
include: "/views/domain_44/view_02394.view.lkml"
include: "/views/domain_45/view_02395.view.lkml"
include: "/views/domain_46/view_02396.view.lkml"

explore: explore_0797 {
  label: "Explore Explore 0797"
  description: "Comprehensive analytics explore joining base view_02392 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_02392
  
  always_filter: {
    filters: [view_02392.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02392.created_at_date: "7 days"]
    unless: [view_02392.id, view_02392.status]
  }

  join: view_02394 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02392.user_id} = ${view_02394.id} ;;
    required_joins: []
  }

  join: view_02395 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02392.account_id} = ${view_02395.account_id} ;;
    required_joins: [view_02394]
  }

  join: view_02396 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02392.category} = ${view_02396.category} ;;
  }

  access_filter: {
    field: view_02392.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02392.is_deleted} = false ;;
}
