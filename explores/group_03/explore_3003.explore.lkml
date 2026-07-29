# Explore: explore_3003
# Auto-generated LookML Explore File

include: "/views/domain_10/view_09010.view.lkml"
include: "/views/domain_12/view_09012.view.lkml"
include: "/views/domain_13/view_09013.view.lkml"
include: "/views/domain_14/view_09014.view.lkml"

explore: explore_3003 {
  label: "Explore Explore 3003"
  description: "Comprehensive analytics explore joining base view_09010 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_09010
  
  always_filter: {
    filters: [view_09010.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09010.created_at_date: "7 days"]
    unless: [view_09010.id, view_09010.status]
  }

  join: view_09012 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09010.user_id} = ${view_09012.id} ;;
    required_joins: []
  }

  join: view_09013 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09010.account_id} = ${view_09013.account_id} ;;
    required_joins: [view_09012]
  }

  join: view_09014 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09010.category} = ${view_09014.category} ;;
  }

  access_filter: {
    field: view_09010.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09010.is_deleted} = false ;;
}
