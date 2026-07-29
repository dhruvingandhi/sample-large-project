# Explore: explore_0944
# Auto-generated LookML Explore File

include: "/views/domain_33/view_02833.view.lkml"
include: "/views/domain_35/view_02835.view.lkml"
include: "/views/domain_36/view_02836.view.lkml"
include: "/views/domain_37/view_02837.view.lkml"

explore: explore_0944 {
  label: "Explore Explore 0944"
  description: "Comprehensive analytics explore joining base view_02833 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_02833
  
  always_filter: {
    filters: [view_02833.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02833.created_at_date: "7 days"]
    unless: [view_02833.id, view_02833.status]
  }

  join: view_02835 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02833.user_id} = ${view_02835.id} ;;
    required_joins: []
  }

  join: view_02836 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02833.account_id} = ${view_02836.account_id} ;;
    required_joins: [view_02835]
  }

  join: view_02837 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02833.category} = ${view_02837.category} ;;
  }

  access_filter: {
    field: view_02833.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02833.is_deleted} = false ;;
}
