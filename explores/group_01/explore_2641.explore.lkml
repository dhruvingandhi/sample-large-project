# Explore: explore_2641
# Auto-generated LookML Explore File

include: "/views/domain_24/view_07924.view.lkml"
include: "/views/domain_26/view_07926.view.lkml"
include: "/views/domain_27/view_07927.view.lkml"
include: "/views/domain_28/view_07928.view.lkml"

explore: explore_2641 {
  label: "Explore Explore 2641"
  description: "Comprehensive analytics explore joining base view_07924 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07924
  
  always_filter: {
    filters: [view_07924.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07924.created_at_date: "7 days"]
    unless: [view_07924.id, view_07924.status]
  }

  join: view_07926 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07924.user_id} = ${view_07926.id} ;;
    required_joins: []
  }

  join: view_07927 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07924.account_id} = ${view_07927.account_id} ;;
    required_joins: [view_07926]
  }

  join: view_07928 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07924.category} = ${view_07928.category} ;;
  }

  access_filter: {
    field: view_07924.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07924.is_deleted} = false ;;
}
