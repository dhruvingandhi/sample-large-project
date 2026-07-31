# Update for 2000 file diff target
# Explore: explore_0038
# Auto-generated LookML Explore File

include: "/views/domain_15/view_00115.view.lkml"
include: "/views/domain_17/view_00117.view.lkml"
include: "/views/domain_18/view_00118.view.lkml"
include: "/views/domain_19/view_00119.view.lkml"

explore: explore_0038 {
  label: "Explore Explore 0038"
  description: "Comprehensive analytics explore joining base view_00115 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_00115
  
  always_filter: {
    filters: [view_00115.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00115.created_at_date: "7 days"]
    unless: [view_00115.id, view_00115.status]
  }

  join: view_00117 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00115.user_id} = ${view_00117.id} ;;
    required_joins: []
  }

  join: view_00118 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00115.account_id} = ${view_00118.account_id} ;;
    required_joins: [view_00117]
  }

  join: view_00119 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00115.category} = ${view_00119.category} ;;
  }

  access_filter: {
    field: view_00115.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00115.is_deleted} = false ;;
}
