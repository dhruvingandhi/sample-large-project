# Explore: explore_3245
# Auto-generated LookML Explore File

include: "/views/domain_36/view_09736.view.lkml"
include: "/views/domain_38/view_09738.view.lkml"
include: "/views/domain_39/view_09739.view.lkml"
include: "/views/domain_40/view_09740.view.lkml"

explore: explore_3245 {
  label: "Explore Explore 3245"
  description: "Comprehensive analytics explore joining base view_09736 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09736
  
  always_filter: {
    filters: [view_09736.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09736.created_at_date: "7 days"]
    unless: [view_09736.id, view_09736.status]
  }

  join: view_09738 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09736.user_id} = ${view_09738.id} ;;
    required_joins: []
  }

  join: view_09739 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09736.account_id} = ${view_09739.account_id} ;;
    required_joins: [view_09738]
  }

  join: view_09740 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09736.category} = ${view_09740.category} ;;
  }

  access_filter: {
    field: view_09736.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09736.is_deleted} = false ;;
}
