# Update for 2000 file diff target
# Explore: explore_0260
# Auto-generated LookML Explore File

include: "/views/domain_31/view_00781.view.lkml"
include: "/views/domain_33/view_00783.view.lkml"
include: "/views/domain_34/view_00784.view.lkml"
include: "/views/domain_35/view_00785.view.lkml"

explore: explore_0260 {
  label: "Explore Explore 0260"
  description: "Comprehensive analytics explore joining base view_00781 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_00781
  
  always_filter: {
    filters: [view_00781.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00781.created_at_date: "7 days"]
    unless: [view_00781.id, view_00781.status]
  }

  join: view_00783 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00781.user_id} = ${view_00783.id} ;;
    required_joins: []
  }

  join: view_00784 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00781.account_id} = ${view_00784.account_id} ;;
    required_joins: [view_00783]
  }

  join: view_00785 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00781.category} = ${view_00785.category} ;;
  }

  access_filter: {
    field: view_00781.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00781.is_deleted} = false ;;
}
