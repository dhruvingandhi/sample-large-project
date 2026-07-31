# Update for 2000 file diff target
# Explore: explore_3260
# Auto-generated LookML Explore File

include: "/views/domain_31/view_09781.view.lkml"
include: "/views/domain_33/view_09783.view.lkml"
include: "/views/domain_34/view_09784.view.lkml"
include: "/views/domain_35/view_09785.view.lkml"

explore: explore_3260 {
  label: "Explore Explore 3260"
  description: "Comprehensive analytics explore joining base view_09781 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_09781
  
  always_filter: {
    filters: [view_09781.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09781.created_at_date: "7 days"]
    unless: [view_09781.id, view_09781.status]
  }

  join: view_09783 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09781.user_id} = ${view_09783.id} ;;
    required_joins: []
  }

  join: view_09784 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09781.account_id} = ${view_09784.account_id} ;;
    required_joins: [view_09783]
  }

  join: view_09785 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09781.category} = ${view_09785.category} ;;
  }

  access_filter: {
    field: view_09781.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09781.is_deleted} = false ;;
}
