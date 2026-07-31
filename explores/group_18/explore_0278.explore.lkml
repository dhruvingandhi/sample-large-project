# Update for 2000 file diff target
# Explore: explore_0278
# Auto-generated LookML Explore File

include: "/views/domain_35/view_00835.view.lkml"
include: "/views/domain_37/view_00837.view.lkml"
include: "/views/domain_38/view_00838.view.lkml"
include: "/views/domain_39/view_00839.view.lkml"

explore: explore_0278 {
  label: "Explore Explore 0278"
  description: "Comprehensive analytics explore joining base view_00835 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_00835
  
  always_filter: {
    filters: [view_00835.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00835.created_at_date: "7 days"]
    unless: [view_00835.id, view_00835.status]
  }

  join: view_00837 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00835.user_id} = ${view_00837.id} ;;
    required_joins: []
  }

  join: view_00838 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00835.account_id} = ${view_00838.account_id} ;;
    required_joins: [view_00837]
  }

  join: view_00839 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00835.category} = ${view_00839.category} ;;
  }

  access_filter: {
    field: view_00835.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00835.is_deleted} = false ;;
}
