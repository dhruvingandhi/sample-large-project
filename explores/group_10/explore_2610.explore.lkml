# Update for 2000 file diff target
# Explore: explore_2610
# Auto-generated LookML Explore File

include: "/views/domain_31/view_07831.view.lkml"
include: "/views/domain_33/view_07833.view.lkml"
include: "/views/domain_34/view_07834.view.lkml"
include: "/views/domain_35/view_07835.view.lkml"

explore: explore_2610 {
  label: "Explore Explore 2610"
  description: "Comprehensive analytics explore joining base view_07831 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_07831
  
  always_filter: {
    filters: [view_07831.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07831.created_at_date: "7 days"]
    unless: [view_07831.id, view_07831.status]
  }

  join: view_07833 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07831.user_id} = ${view_07833.id} ;;
    required_joins: []
  }

  join: view_07834 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07831.account_id} = ${view_07834.account_id} ;;
    required_joins: [view_07833]
  }

  join: view_07835 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07831.category} = ${view_07835.category} ;;
  }

  access_filter: {
    field: view_07831.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07831.is_deleted} = false ;;
}
