# Explore: explore_2764
# Auto-generated LookML Explore File

include: "/views/domain_43/view_08293.view.lkml"
include: "/views/domain_45/view_08295.view.lkml"
include: "/views/domain_46/view_08296.view.lkml"
include: "/views/domain_47/view_08297.view.lkml"

explore: explore_2764 {
  label: "Explore Explore 2764"
  description: "Comprehensive analytics explore joining base view_08293 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_08293
  
  always_filter: {
    filters: [view_08293.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08293.created_at_date: "7 days"]
    unless: [view_08293.id, view_08293.status]
  }

  join: view_08295 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08293.user_id} = ${view_08295.id} ;;
    required_joins: []
  }

  join: view_08296 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08293.account_id} = ${view_08296.account_id} ;;
    required_joins: [view_08295]
  }

  join: view_08297 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08293.category} = ${view_08297.category} ;;
  }

  access_filter: {
    field: view_08293.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08293.is_deleted} = false ;;
}
