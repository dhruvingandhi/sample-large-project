# Explore: explore_1831
# Auto-generated LookML Explore File

include: "/views/domain_44/view_05494.view.lkml"
include: "/views/domain_46/view_05496.view.lkml"
include: "/views/domain_47/view_05497.view.lkml"
include: "/views/domain_48/view_05498.view.lkml"

explore: explore_1831 {
  label: "Explore Explore 1831"
  description: "Comprehensive analytics explore joining base view_05494 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_05494
  
  always_filter: {
    filters: [view_05494.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05494.created_at_date: "7 days"]
    unless: [view_05494.id, view_05494.status]
  }

  join: view_05496 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05494.user_id} = ${view_05496.id} ;;
    required_joins: []
  }

  join: view_05497 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05494.account_id} = ${view_05497.account_id} ;;
    required_joins: [view_05496]
  }

  join: view_05498 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05494.category} = ${view_05498.category} ;;
  }

  access_filter: {
    field: view_05494.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05494.is_deleted} = false ;;
}
