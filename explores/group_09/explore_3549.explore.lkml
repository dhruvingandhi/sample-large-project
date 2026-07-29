# Explore: explore_3549
# Auto-generated LookML Explore File

include: "/views/domain_48/view_10648.view.lkml"
include: "/views/domain_50/view_10650.view.lkml"
include: "/views/domain_01/view_10651.view.lkml"
include: "/views/domain_02/view_10652.view.lkml"

explore: explore_3549 {
  label: "Explore Explore 3549"
  description: "Comprehensive analytics explore joining base view_10648 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_10648
  
  always_filter: {
    filters: [view_10648.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10648.created_at_date: "7 days"]
    unless: [view_10648.id, view_10648.status]
  }

  join: view_10650 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10648.user_id} = ${view_10650.id} ;;
    required_joins: []
  }

  join: view_10651 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10648.account_id} = ${view_10651.account_id} ;;
    required_joins: [view_10650]
  }

  join: view_10652 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10648.category} = ${view_10652.category} ;;
  }

  access_filter: {
    field: view_10648.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10648.is_deleted} = false ;;
}
