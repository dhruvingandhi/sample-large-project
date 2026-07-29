# Explore: explore_3931
# Auto-generated LookML Explore File

include: "/views/domain_44/view_11794.view.lkml"
include: "/views/domain_46/view_11796.view.lkml"
include: "/views/domain_47/view_11797.view.lkml"
include: "/views/domain_48/view_11798.view.lkml"

explore: explore_3931 {
  label: "Explore Explore 3931"
  description: "Comprehensive analytics explore joining base view_11794 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_11794
  
  always_filter: {
    filters: [view_11794.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11794.created_at_date: "7 days"]
    unless: [view_11794.id, view_11794.status]
  }

  join: view_11796 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11794.user_id} = ${view_11796.id} ;;
    required_joins: []
  }

  join: view_11797 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11794.account_id} = ${view_11797.account_id} ;;
    required_joins: [view_11796]
  }

  join: view_11798 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11794.category} = ${view_11798.category} ;;
  }

  access_filter: {
    field: view_11794.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11794.is_deleted} = false ;;
}
