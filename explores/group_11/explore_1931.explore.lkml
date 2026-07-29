# Explore: explore_1931
# Auto-generated LookML Explore File

include: "/views/domain_44/view_05794.view.lkml"
include: "/views/domain_46/view_05796.view.lkml"
include: "/views/domain_47/view_05797.view.lkml"
include: "/views/domain_48/view_05798.view.lkml"

explore: explore_1931 {
  label: "Explore Explore 1931"
  description: "Comprehensive analytics explore joining base view_05794 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_05794
  
  always_filter: {
    filters: [view_05794.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05794.created_at_date: "7 days"]
    unless: [view_05794.id, view_05794.status]
  }

  join: view_05796 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05794.user_id} = ${view_05796.id} ;;
    required_joins: []
  }

  join: view_05797 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05794.account_id} = ${view_05797.account_id} ;;
    required_joins: [view_05796]
  }

  join: view_05798 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05794.category} = ${view_05798.category} ;;
  }

  access_filter: {
    field: view_05794.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05794.is_deleted} = false ;;
}
