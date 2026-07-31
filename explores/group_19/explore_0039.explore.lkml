# Update for 2000 file diff target
# Explore: explore_0039
# Auto-generated LookML Explore File

include: "/views/domain_18/view_00118.view.lkml"
include: "/views/domain_20/view_00120.view.lkml"
include: "/views/domain_21/view_00121.view.lkml"
include: "/views/domain_22/view_00122.view.lkml"

explore: explore_0039 {
  label: "Explore Explore 0039"
  description: "Comprehensive analytics explore joining base view_00118 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_00118
  
  always_filter: {
    filters: [view_00118.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00118.created_at_date: "7 days"]
    unless: [view_00118.id, view_00118.status]
  }

  join: view_00120 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00118.user_id} = ${view_00120.id} ;;
    required_joins: []
  }

  join: view_00121 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00118.account_id} = ${view_00121.account_id} ;;
    required_joins: [view_00120]
  }

  join: view_00122 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00118.category} = ${view_00122.category} ;;
  }

  access_filter: {
    field: view_00118.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00118.is_deleted} = false ;;
}
