# Explore: explore_3664
# Auto-generated LookML Explore File

include: "/views/domain_43/view_10993.view.lkml"
include: "/views/domain_45/view_10995.view.lkml"
include: "/views/domain_46/view_10996.view.lkml"
include: "/views/domain_47/view_10997.view.lkml"

explore: explore_3664 {
  label: "Explore Explore 3664"
  description: "Comprehensive analytics explore joining base view_10993 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10993
  
  always_filter: {
    filters: [view_10993.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10993.created_at_date: "7 days"]
    unless: [view_10993.id, view_10993.status]
  }

  join: view_10995 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10993.user_id} = ${view_10995.id} ;;
    required_joins: []
  }

  join: view_10996 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10993.account_id} = ${view_10996.account_id} ;;
    required_joins: [view_10995]
  }

  join: view_10997 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10993.category} = ${view_10997.category} ;;
  }

  access_filter: {
    field: view_10993.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10993.is_deleted} = false ;;
}
