# Explore: explore_1764
# Auto-generated LookML Explore File

include: "/views/domain_43/view_05293.view.lkml"
include: "/views/domain_45/view_05295.view.lkml"
include: "/views/domain_46/view_05296.view.lkml"
include: "/views/domain_47/view_05297.view.lkml"

explore: explore_1764 {
  label: "Explore Explore 1764"
  description: "Comprehensive analytics explore joining base view_05293 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_05293
  
  always_filter: {
    filters: [view_05293.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05293.created_at_date: "7 days"]
    unless: [view_05293.id, view_05293.status]
  }

  join: view_05295 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05293.user_id} = ${view_05295.id} ;;
    required_joins: []
  }

  join: view_05296 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05293.account_id} = ${view_05296.account_id} ;;
    required_joins: [view_05295]
  }

  join: view_05297 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05293.category} = ${view_05297.category} ;;
  }

  access_filter: {
    field: view_05293.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05293.is_deleted} = false ;;
}
