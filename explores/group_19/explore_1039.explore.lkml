# Update for 2000 file diff target
# Explore: explore_1039
# Auto-generated LookML Explore File

include: "/views/domain_18/view_03118.view.lkml"
include: "/views/domain_20/view_03120.view.lkml"
include: "/views/domain_21/view_03121.view.lkml"
include: "/views/domain_22/view_03122.view.lkml"

explore: explore_1039 {
  label: "Explore Explore 1039"
  description: "Comprehensive analytics explore joining base view_03118 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_03118
  
  always_filter: {
    filters: [view_03118.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03118.created_at_date: "7 days"]
    unless: [view_03118.id, view_03118.status]
  }

  join: view_03120 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03118.user_id} = ${view_03120.id} ;;
    required_joins: []
  }

  join: view_03121 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03118.account_id} = ${view_03121.account_id} ;;
    required_joins: [view_03120]
  }

  join: view_03122 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03118.category} = ${view_03122.category} ;;
  }

  access_filter: {
    field: view_03118.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03118.is_deleted} = false ;;
}
