# Explore: explore_2213
# Auto-generated LookML Explore File

include: "/views/domain_40/view_06640.view.lkml"
include: "/views/domain_42/view_06642.view.lkml"
include: "/views/domain_43/view_06643.view.lkml"
include: "/views/domain_44/view_06644.view.lkml"

explore: explore_2213 {
  label: "Explore Explore 2213"
  description: "Comprehensive analytics explore joining base view_06640 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_06640
  
  always_filter: {
    filters: [view_06640.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06640.created_at_date: "7 days"]
    unless: [view_06640.id, view_06640.status]
  }

  join: view_06642 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06640.user_id} = ${view_06642.id} ;;
    required_joins: []
  }

  join: view_06643 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06640.account_id} = ${view_06643.account_id} ;;
    required_joins: [view_06642]
  }

  join: view_06644 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06640.category} = ${view_06644.category} ;;
  }

  access_filter: {
    field: view_06640.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06640.is_deleted} = false ;;
}
