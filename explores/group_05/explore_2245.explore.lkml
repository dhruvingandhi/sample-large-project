# Explore: explore_2245
# Auto-generated LookML Explore File

include: "/views/domain_36/view_06736.view.lkml"
include: "/views/domain_38/view_06738.view.lkml"
include: "/views/domain_39/view_06739.view.lkml"
include: "/views/domain_40/view_06740.view.lkml"

explore: explore_2245 {
  label: "Explore Explore 2245"
  description: "Comprehensive analytics explore joining base view_06736 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06736
  
  always_filter: {
    filters: [view_06736.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06736.created_at_date: "7 days"]
    unless: [view_06736.id, view_06736.status]
  }

  join: view_06738 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06736.user_id} = ${view_06738.id} ;;
    required_joins: []
  }

  join: view_06739 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06736.account_id} = ${view_06739.account_id} ;;
    required_joins: [view_06738]
  }

  join: view_06740 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06736.category} = ${view_06740.category} ;;
  }

  access_filter: {
    field: view_06736.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06736.is_deleted} = false ;;
}
