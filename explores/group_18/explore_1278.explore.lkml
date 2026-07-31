# Update for 2000 file diff target
# Explore: explore_1278
# Auto-generated LookML Explore File

include: "/views/domain_35/view_03835.view.lkml"
include: "/views/domain_37/view_03837.view.lkml"
include: "/views/domain_38/view_03838.view.lkml"
include: "/views/domain_39/view_03839.view.lkml"

explore: explore_1278 {
  label: "Explore Explore 1278"
  description: "Comprehensive analytics explore joining base view_03835 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_03835
  
  always_filter: {
    filters: [view_03835.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03835.created_at_date: "7 days"]
    unless: [view_03835.id, view_03835.status]
  }

  join: view_03837 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03835.user_id} = ${view_03837.id} ;;
    required_joins: []
  }

  join: view_03838 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03835.account_id} = ${view_03838.account_id} ;;
    required_joins: [view_03837]
  }

  join: view_03839 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03835.category} = ${view_03839.category} ;;
  }

  access_filter: {
    field: view_03835.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03835.is_deleted} = false ;;
}
