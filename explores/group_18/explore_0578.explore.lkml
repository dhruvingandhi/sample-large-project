# Update for 2000 file diff target
# Explore: explore_0578
# Auto-generated LookML Explore File

include: "/views/domain_35/view_01735.view.lkml"
include: "/views/domain_37/view_01737.view.lkml"
include: "/views/domain_38/view_01738.view.lkml"
include: "/views/domain_39/view_01739.view.lkml"

explore: explore_0578 {
  label: "Explore Explore 0578"
  description: "Comprehensive analytics explore joining base view_01735 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_01735
  
  always_filter: {
    filters: [view_01735.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01735.created_at_date: "7 days"]
    unless: [view_01735.id, view_01735.status]
  }

  join: view_01737 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01735.user_id} = ${view_01737.id} ;;
    required_joins: []
  }

  join: view_01738 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01735.account_id} = ${view_01738.account_id} ;;
    required_joins: [view_01737]
  }

  join: view_01739 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01735.category} = ${view_01739.category} ;;
  }

  access_filter: {
    field: view_01735.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01735.is_deleted} = false ;;
}
