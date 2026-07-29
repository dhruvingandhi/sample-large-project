# Explore: explore_0213
# Auto-generated LookML Explore File

include: "/views/domain_40/view_00640.view.lkml"
include: "/views/domain_42/view_00642.view.lkml"
include: "/views/domain_43/view_00643.view.lkml"
include: "/views/domain_44/view_00644.view.lkml"

explore: explore_0213 {
  label: "Explore Explore 0213"
  description: "Comprehensive analytics explore joining base view_00640 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_00640
  
  always_filter: {
    filters: [view_00640.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00640.created_at_date: "7 days"]
    unless: [view_00640.id, view_00640.status]
  }

  join: view_00642 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00640.user_id} = ${view_00642.id} ;;
    required_joins: []
  }

  join: view_00643 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00640.account_id} = ${view_00643.account_id} ;;
    required_joins: [view_00642]
  }

  join: view_00644 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00640.category} = ${view_00644.category} ;;
  }

  access_filter: {
    field: view_00640.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00640.is_deleted} = false ;;
}
