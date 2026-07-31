# Update for 500 file diff target
# Explore: explore_1822
# Auto-generated LookML Explore File

include: "/views/domain_17/view_05467.view.lkml"
include: "/views/domain_19/view_05469.view.lkml"
include: "/views/domain_20/view_05470.view.lkml"
include: "/views/domain_21/view_05471.view.lkml"

explore: explore_1822 {
  label: "Explore Explore 1822"
  description: "Comprehensive analytics explore joining base view_05467 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_05467
  
  always_filter: {
    filters: [view_05467.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05467.created_at_date: "7 days"]
    unless: [view_05467.id, view_05467.status]
  }

  join: view_05469 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05467.user_id} = ${view_05469.id} ;;
    required_joins: []
  }

  join: view_05470 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05467.account_id} = ${view_05470.account_id} ;;
    required_joins: [view_05469]
  }

  join: view_05471 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05467.category} = ${view_05471.category} ;;
  }

  access_filter: {
    field: view_05467.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05467.is_deleted} = false ;;
}
