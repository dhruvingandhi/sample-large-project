# Explore: explore_3277
# Auto-generated LookML Explore File

include: "/views/domain_32/view_09832.view.lkml"
include: "/views/domain_34/view_09834.view.lkml"
include: "/views/domain_35/view_09835.view.lkml"
include: "/views/domain_36/view_09836.view.lkml"

explore: explore_3277 {
  label: "Explore Explore 3277"
  description: "Comprehensive analytics explore joining base view_09832 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_09832
  
  always_filter: {
    filters: [view_09832.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09832.created_at_date: "7 days"]
    unless: [view_09832.id, view_09832.status]
  }

  join: view_09834 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09832.user_id} = ${view_09834.id} ;;
    required_joins: []
  }

  join: view_09835 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09832.account_id} = ${view_09835.account_id} ;;
    required_joins: [view_09834]
  }

  join: view_09836 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09832.category} = ${view_09836.category} ;;
  }

  access_filter: {
    field: view_09832.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09832.is_deleted} = false ;;
}
