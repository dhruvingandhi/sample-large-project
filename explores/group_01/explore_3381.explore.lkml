# Explore: explore_3381
# Auto-generated LookML Explore File

include: "/views/domain_44/view_10144.view.lkml"
include: "/views/domain_46/view_10146.view.lkml"
include: "/views/domain_47/view_10147.view.lkml"
include: "/views/domain_48/view_10148.view.lkml"

explore: explore_3381 {
  label: "Explore Explore 3381"
  description: "Comprehensive analytics explore joining base view_10144 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10144
  
  always_filter: {
    filters: [view_10144.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10144.created_at_date: "7 days"]
    unless: [view_10144.id, view_10144.status]
  }

  join: view_10146 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10144.user_id} = ${view_10146.id} ;;
    required_joins: []
  }

  join: view_10147 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10144.account_id} = ${view_10147.account_id} ;;
    required_joins: [view_10146]
  }

  join: view_10148 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10144.category} = ${view_10148.category} ;;
  }

  access_filter: {
    field: view_10144.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10144.is_deleted} = false ;;
}
