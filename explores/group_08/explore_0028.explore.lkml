# Explore: explore_0028
# Auto-generated LookML Explore File

include: "/views/domain_35/view_00085.view.lkml"
include: "/views/domain_37/view_00087.view.lkml"
include: "/views/domain_38/view_00088.view.lkml"
include: "/views/domain_39/view_00089.view.lkml"

explore: explore_0028 {
  label: "Explore Explore 0028"
  description: "Comprehensive analytics explore joining base view_00085 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_00085
  
  always_filter: {
    filters: [view_00085.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00085.created_at_date: "7 days"]
    unless: [view_00085.id, view_00085.status]
  }

  join: view_00087 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00085.user_id} = ${view_00087.id} ;;
    required_joins: []
  }

  join: view_00088 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00085.account_id} = ${view_00088.account_id} ;;
    required_joins: [view_00087]
  }

  join: view_00089 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00085.category} = ${view_00089.category} ;;
  }

  access_filter: {
    field: view_00085.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00085.is_deleted} = false ;;
}
