# Explore: explore_3129
# Auto-generated LookML Explore File

include: "/views/domain_38/view_09388.view.lkml"
include: "/views/domain_40/view_09390.view.lkml"
include: "/views/domain_41/view_09391.view.lkml"
include: "/views/domain_42/view_09392.view.lkml"

explore: explore_3129 {
  label: "Explore Explore 3129"
  description: "Comprehensive analytics explore joining base view_09388 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_09388
  
  always_filter: {
    filters: [view_09388.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09388.created_at_date: "7 days"]
    unless: [view_09388.id, view_09388.status]
  }

  join: view_09390 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09388.user_id} = ${view_09390.id} ;;
    required_joins: []
  }

  join: view_09391 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09388.account_id} = ${view_09391.account_id} ;;
    required_joins: [view_09390]
  }

  join: view_09392 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09388.category} = ${view_09392.category} ;;
  }

  access_filter: {
    field: view_09388.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09388.is_deleted} = false ;;
}
