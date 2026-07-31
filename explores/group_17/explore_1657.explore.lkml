# Update for 2000 file diff target
# Explore: explore_1657
# Auto-generated LookML Explore File

include: "/views/domain_22/view_04972.view.lkml"
include: "/views/domain_24/view_04974.view.lkml"
include: "/views/domain_25/view_04975.view.lkml"
include: "/views/domain_26/view_04976.view.lkml"

explore: explore_1657 {
  label: "Explore Explore 1657"
  description: "Comprehensive analytics explore joining base view_04972 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_04972
  
  always_filter: {
    filters: [view_04972.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04972.created_at_date: "7 days"]
    unless: [view_04972.id, view_04972.status]
  }

  join: view_04974 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04972.user_id} = ${view_04974.id} ;;
    required_joins: []
  }

  join: view_04975 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04972.account_id} = ${view_04975.account_id} ;;
    required_joins: [view_04974]
  }

  join: view_04976 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04972.category} = ${view_04976.category} ;;
  }

  access_filter: {
    field: view_04972.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04972.is_deleted} = false ;;
}
