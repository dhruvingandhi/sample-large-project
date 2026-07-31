# Update for 2000 file diff target
# Explore: explore_3879
# Auto-generated LookML Explore File

include: "/views/domain_38/view_11638.view.lkml"
include: "/views/domain_40/view_11640.view.lkml"
include: "/views/domain_41/view_11641.view.lkml"
include: "/views/domain_42/view_11642.view.lkml"

explore: explore_3879 {
  label: "Explore Explore 3879"
  description: "Comprehensive analytics explore joining base view_11638 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_11638
  
  always_filter: {
    filters: [view_11638.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11638.created_at_date: "7 days"]
    unless: [view_11638.id, view_11638.status]
  }

  join: view_11640 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11638.user_id} = ${view_11640.id} ;;
    required_joins: []
  }

  join: view_11641 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11638.account_id} = ${view_11641.account_id} ;;
    required_joins: [view_11640]
  }

  join: view_11642 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11638.category} = ${view_11642.category} ;;
  }

  access_filter: {
    field: view_11638.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11638.is_deleted} = false ;;
}
