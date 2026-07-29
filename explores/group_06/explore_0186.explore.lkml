# Explore: explore_0186
# Auto-generated LookML Explore File

include: "/views/domain_09/view_00559.view.lkml"
include: "/views/domain_11/view_00561.view.lkml"
include: "/views/domain_12/view_00562.view.lkml"
include: "/views/domain_13/view_00563.view.lkml"

explore: explore_0186 {
  label: "Explore Explore 0186"
  description: "Comprehensive analytics explore joining base view_00559 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_00559
  
  always_filter: {
    filters: [view_00559.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00559.created_at_date: "7 days"]
    unless: [view_00559.id, view_00559.status]
  }

  join: view_00561 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00559.user_id} = ${view_00561.id} ;;
    required_joins: []
  }

  join: view_00562 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00559.account_id} = ${view_00562.account_id} ;;
    required_joins: [view_00561]
  }

  join: view_00563 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00559.category} = ${view_00563.category} ;;
  }

  access_filter: {
    field: view_00559.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00559.is_deleted} = false ;;
}
