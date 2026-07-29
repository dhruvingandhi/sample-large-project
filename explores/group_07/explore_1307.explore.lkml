# Explore: explore_1307
# Auto-generated LookML Explore File

include: "/views/domain_22/view_03922.view.lkml"
include: "/views/domain_24/view_03924.view.lkml"
include: "/views/domain_25/view_03925.view.lkml"
include: "/views/domain_26/view_03926.view.lkml"

explore: explore_1307 {
  label: "Explore Explore 1307"
  description: "Comprehensive analytics explore joining base view_03922 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_03922
  
  always_filter: {
    filters: [view_03922.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03922.created_at_date: "7 days"]
    unless: [view_03922.id, view_03922.status]
  }

  join: view_03924 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03922.user_id} = ${view_03924.id} ;;
    required_joins: []
  }

  join: view_03925 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03922.account_id} = ${view_03925.account_id} ;;
    required_joins: [view_03924]
  }

  join: view_03926 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03922.category} = ${view_03926.category} ;;
  }

  access_filter: {
    field: view_03922.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03922.is_deleted} = false ;;
}
