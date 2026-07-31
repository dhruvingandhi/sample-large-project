# Update for 500 file diff target
# Explore: explore_1082
# Auto-generated LookML Explore File

include: "/views/domain_47/view_03247.view.lkml"
include: "/views/domain_49/view_03249.view.lkml"
include: "/views/domain_50/view_03250.view.lkml"
include: "/views/domain_01/view_03251.view.lkml"

explore: explore_1082 {
  label: "Explore Explore 1082"
  description: "Comprehensive analytics explore joining base view_03247 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_03247
  
  always_filter: {
    filters: [view_03247.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03247.created_at_date: "7 days"]
    unless: [view_03247.id, view_03247.status]
  }

  join: view_03249 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03247.user_id} = ${view_03249.id} ;;
    required_joins: []
  }

  join: view_03250 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03247.account_id} = ${view_03250.account_id} ;;
    required_joins: [view_03249]
  }

  join: view_03251 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03247.category} = ${view_03251.category} ;;
  }

  access_filter: {
    field: view_03247.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03247.is_deleted} = false ;;
}
