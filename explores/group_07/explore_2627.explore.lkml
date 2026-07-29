# Explore: explore_2627
# Auto-generated LookML Explore File

include: "/views/domain_32/view_07882.view.lkml"
include: "/views/domain_34/view_07884.view.lkml"
include: "/views/domain_35/view_07885.view.lkml"
include: "/views/domain_36/view_07886.view.lkml"

explore: explore_2627 {
  label: "Explore Explore 2627"
  description: "Comprehensive analytics explore joining base view_07882 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_07882
  
  always_filter: {
    filters: [view_07882.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07882.created_at_date: "7 days"]
    unless: [view_07882.id, view_07882.status]
  }

  join: view_07884 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07882.user_id} = ${view_07884.id} ;;
    required_joins: []
  }

  join: view_07885 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07882.account_id} = ${view_07885.account_id} ;;
    required_joins: [view_07884]
  }

  join: view_07886 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07882.category} = ${view_07886.category} ;;
  }

  access_filter: {
    field: view_07882.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07882.is_deleted} = false ;;
}
