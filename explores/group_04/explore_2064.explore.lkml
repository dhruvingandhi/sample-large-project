# Explore: explore_2064
# Auto-generated LookML Explore File

include: "/views/domain_43/view_06193.view.lkml"
include: "/views/domain_45/view_06195.view.lkml"
include: "/views/domain_46/view_06196.view.lkml"
include: "/views/domain_47/view_06197.view.lkml"

explore: explore_2064 {
  label: "Explore Explore 2064"
  description: "Comprehensive analytics explore joining base view_06193 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_06193
  
  always_filter: {
    filters: [view_06193.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06193.created_at_date: "7 days"]
    unless: [view_06193.id, view_06193.status]
  }

  join: view_06195 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06193.user_id} = ${view_06195.id} ;;
    required_joins: []
  }

  join: view_06196 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06193.account_id} = ${view_06196.account_id} ;;
    required_joins: [view_06195]
  }

  join: view_06197 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06193.category} = ${view_06197.category} ;;
  }

  access_filter: {
    field: view_06193.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06193.is_deleted} = false ;;
}
