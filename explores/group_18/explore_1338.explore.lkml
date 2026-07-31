# Update for 2000 file diff target
# Explore: explore_1338
# Auto-generated LookML Explore File

include: "/views/domain_15/view_04015.view.lkml"
include: "/views/domain_17/view_04017.view.lkml"
include: "/views/domain_18/view_04018.view.lkml"
include: "/views/domain_19/view_04019.view.lkml"

explore: explore_1338 {
  label: "Explore Explore 1338"
  description: "Comprehensive analytics explore joining base view_04015 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_04015
  
  always_filter: {
    filters: [view_04015.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04015.created_at_date: "7 days"]
    unless: [view_04015.id, view_04015.status]
  }

  join: view_04017 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04015.user_id} = ${view_04017.id} ;;
    required_joins: []
  }

  join: view_04018 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04015.account_id} = ${view_04018.account_id} ;;
    required_joins: [view_04017]
  }

  join: view_04019 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04015.category} = ${view_04019.category} ;;
  }

  access_filter: {
    field: view_04015.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04015.is_deleted} = false ;;
}
