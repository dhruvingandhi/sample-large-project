# Update for 2000 file diff target
# Explore: explore_0959
# Auto-generated LookML Explore File

include: "/views/domain_28/view_02878.view.lkml"
include: "/views/domain_30/view_02880.view.lkml"
include: "/views/domain_31/view_02881.view.lkml"
include: "/views/domain_32/view_02882.view.lkml"

explore: explore_0959 {
  label: "Explore Explore 0959"
  description: "Comprehensive analytics explore joining base view_02878 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_02878
  
  always_filter: {
    filters: [view_02878.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02878.created_at_date: "7 days"]
    unless: [view_02878.id, view_02878.status]
  }

  join: view_02880 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02878.user_id} = ${view_02880.id} ;;
    required_joins: []
  }

  join: view_02881 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02878.account_id} = ${view_02881.account_id} ;;
    required_joins: [view_02880]
  }

  join: view_02882 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02878.category} = ${view_02882.category} ;;
  }

  access_filter: {
    field: view_02878.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02878.is_deleted} = false ;;
}
