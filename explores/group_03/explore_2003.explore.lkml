# Explore: explore_2003
# Auto-generated LookML Explore File

include: "/views/domain_10/view_06010.view.lkml"
include: "/views/domain_12/view_06012.view.lkml"
include: "/views/domain_13/view_06013.view.lkml"
include: "/views/domain_14/view_06014.view.lkml"

explore: explore_2003 {
  label: "Explore Explore 2003"
  description: "Comprehensive analytics explore joining base view_06010 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_06010
  
  always_filter: {
    filters: [view_06010.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06010.created_at_date: "7 days"]
    unless: [view_06010.id, view_06010.status]
  }

  join: view_06012 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06010.user_id} = ${view_06012.id} ;;
    required_joins: []
  }

  join: view_06013 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06010.account_id} = ${view_06013.account_id} ;;
    required_joins: [view_06012]
  }

  join: view_06014 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06010.category} = ${view_06014.category} ;;
  }

  access_filter: {
    field: view_06010.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06010.is_deleted} = false ;;
}
