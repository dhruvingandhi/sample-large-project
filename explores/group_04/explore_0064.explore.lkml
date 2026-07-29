# Explore: explore_0064
# Auto-generated LookML Explore File

include: "/views/domain_43/view_00193.view.lkml"
include: "/views/domain_45/view_00195.view.lkml"
include: "/views/domain_46/view_00196.view.lkml"
include: "/views/domain_47/view_00197.view.lkml"

explore: explore_0064 {
  label: "Explore Explore 0064"
  description: "Comprehensive analytics explore joining base view_00193 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00193
  
  always_filter: {
    filters: [view_00193.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00193.created_at_date: "7 days"]
    unless: [view_00193.id, view_00193.status]
  }

  join: view_00195 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00193.user_id} = ${view_00195.id} ;;
    required_joins: []
  }

  join: view_00196 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00193.account_id} = ${view_00196.account_id} ;;
    required_joins: [view_00195]
  }

  join: view_00197 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00193.category} = ${view_00197.category} ;;
  }

  access_filter: {
    field: view_00193.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00193.is_deleted} = false ;;
}
