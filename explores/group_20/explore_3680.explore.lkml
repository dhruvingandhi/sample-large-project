# Explore: explore_3680
# Auto-generated LookML Explore File

include: "/views/domain_41/view_11041.view.lkml"
include: "/views/domain_43/view_11043.view.lkml"
include: "/views/domain_44/view_11044.view.lkml"
include: "/views/domain_45/view_11045.view.lkml"

explore: explore_3680 {
  label: "Explore Explore 3680"
  description: "Comprehensive analytics explore joining base view_11041 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_11041
  
  always_filter: {
    filters: [view_11041.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11041.created_at_date: "7 days"]
    unless: [view_11041.id, view_11041.status]
  }

  join: view_11043 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11041.user_id} = ${view_11043.id} ;;
    required_joins: []
  }

  join: view_11044 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11041.account_id} = ${view_11044.account_id} ;;
    required_joins: [view_11043]
  }

  join: view_11045 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11041.category} = ${view_11045.category} ;;
  }

  access_filter: {
    field: view_11041.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11041.is_deleted} = false ;;
}
