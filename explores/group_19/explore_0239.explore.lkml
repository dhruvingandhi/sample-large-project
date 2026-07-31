# Update for 2000 file diff target
# Explore: explore_0239
# Auto-generated LookML Explore File

include: "/views/domain_18/view_00718.view.lkml"
include: "/views/domain_20/view_00720.view.lkml"
include: "/views/domain_21/view_00721.view.lkml"
include: "/views/domain_22/view_00722.view.lkml"

explore: explore_0239 {
  label: "Explore Explore 0239"
  description: "Comprehensive analytics explore joining base view_00718 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_00718
  
  always_filter: {
    filters: [view_00718.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00718.created_at_date: "7 days"]
    unless: [view_00718.id, view_00718.status]
  }

  join: view_00720 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00718.user_id} = ${view_00720.id} ;;
    required_joins: []
  }

  join: view_00721 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00718.account_id} = ${view_00721.account_id} ;;
    required_joins: [view_00720]
  }

  join: view_00722 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00718.category} = ${view_00722.category} ;;
  }

  access_filter: {
    field: view_00718.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00718.is_deleted} = false ;;
}
