# Explore: explore_3657
# Auto-generated LookML Explore File

include: "/views/domain_22/view_10972.view.lkml"
include: "/views/domain_24/view_10974.view.lkml"
include: "/views/domain_25/view_10975.view.lkml"
include: "/views/domain_26/view_10976.view.lkml"

explore: explore_3657 {
  label: "Explore Explore 3657"
  description: "Comprehensive analytics explore joining base view_10972 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_10972
  
  always_filter: {
    filters: [view_10972.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10972.created_at_date: "7 days"]
    unless: [view_10972.id, view_10972.status]
  }

  join: view_10974 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10972.user_id} = ${view_10974.id} ;;
    required_joins: []
  }

  join: view_10975 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10972.account_id} = ${view_10975.account_id} ;;
    required_joins: [view_10974]
  }

  join: view_10976 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10972.category} = ${view_10976.category} ;;
  }

  access_filter: {
    field: view_10972.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10972.is_deleted} = false ;;
}
