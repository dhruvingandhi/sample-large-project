# Explore: explore_2281
# Auto-generated LookML Explore File

include: "/views/domain_44/view_06844.view.lkml"
include: "/views/domain_46/view_06846.view.lkml"
include: "/views/domain_47/view_06847.view.lkml"
include: "/views/domain_48/view_06848.view.lkml"

explore: explore_2281 {
  label: "Explore Explore 2281"
  description: "Comprehensive analytics explore joining base view_06844 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06844
  
  always_filter: {
    filters: [view_06844.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06844.created_at_date: "7 days"]
    unless: [view_06844.id, view_06844.status]
  }

  join: view_06846 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06844.user_id} = ${view_06846.id} ;;
    required_joins: []
  }

  join: view_06847 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06844.account_id} = ${view_06847.account_id} ;;
    required_joins: [view_06846]
  }

  join: view_06848 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06844.category} = ${view_06848.category} ;;
  }

  access_filter: {
    field: view_06844.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06844.is_deleted} = false ;;
}
