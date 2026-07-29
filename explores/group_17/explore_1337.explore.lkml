# Explore: explore_1337
# Auto-generated LookML Explore File

include: "/views/domain_12/view_04012.view.lkml"
include: "/views/domain_14/view_04014.view.lkml"
include: "/views/domain_15/view_04015.view.lkml"
include: "/views/domain_16/view_04016.view.lkml"

explore: explore_1337 {
  label: "Explore Explore 1337"
  description: "Comprehensive analytics explore joining base view_04012 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_04012
  
  always_filter: {
    filters: [view_04012.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04012.created_at_date: "7 days"]
    unless: [view_04012.id, view_04012.status]
  }

  join: view_04014 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04012.user_id} = ${view_04014.id} ;;
    required_joins: []
  }

  join: view_04015 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04012.account_id} = ${view_04015.account_id} ;;
    required_joins: [view_04014]
  }

  join: view_04016 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04012.category} = ${view_04016.category} ;;
  }

  access_filter: {
    field: view_04012.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04012.is_deleted} = false ;;
}
