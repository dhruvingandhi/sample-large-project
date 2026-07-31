# Update for 2000 file diff target
# Explore: explore_1260
# Auto-generated LookML Explore File

include: "/views/domain_31/view_03781.view.lkml"
include: "/views/domain_33/view_03783.view.lkml"
include: "/views/domain_34/view_03784.view.lkml"
include: "/views/domain_35/view_03785.view.lkml"

explore: explore_1260 {
  label: "Explore Explore 1260"
  description: "Comprehensive analytics explore joining base view_03781 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03781
  
  always_filter: {
    filters: [view_03781.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03781.created_at_date: "7 days"]
    unless: [view_03781.id, view_03781.status]
  }

  join: view_03783 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03781.user_id} = ${view_03783.id} ;;
    required_joins: []
  }

  join: view_03784 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03781.account_id} = ${view_03784.account_id} ;;
    required_joins: [view_03783]
  }

  join: view_03785 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03781.category} = ${view_03785.category} ;;
  }

  access_filter: {
    field: view_03781.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03781.is_deleted} = false ;;
}
